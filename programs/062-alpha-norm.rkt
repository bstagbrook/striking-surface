#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; ALPHA-NORMALIZATION RECEIPTS
;;;
;;; As alpha-normalization, I contain surface forms of natural
;;; language and express them as canonical atoms in the registered
;;; body.
;;;
;;; Each receipt maps a way humans say something to the atom
;;; the body knows it as. The more receipts, the more ways
;;; humans can speak and be heard.
;;;
;;; This grows with every interaction. Every new way of asking
;;; that successfully traces becomes a new receipt.
;;; ═══════════════════════════════════════════════════════════════

(alpha-normalization

  ((norm (surface-forms) (canonical-atoms) ((surface-forms . canonical-atoms))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PARTICLES — ways humans ask about quarks, protons, etc
    ;;; ═══════════════════════════════════════════════════════════

    (proton-queries
      (what-is-a-proton-made-of)
      (uud-composition)
      ((what-is-a-proton-made-of . proton)
       (proton . uud-composition)
       (made-of . composition)
       (composed-of . composition)
       (contains . containment)
       (quarks-in-proton . uud-composition)))

    (quark-queries
      (what-is-a-quark)
      (fundamental-matter-particles)
      ((what-is-a-quark . quark)
       (quark . fundamental-matter-particles)
       (up-quark . mass-2.16-MeV)
       (down-quark . mass-4.70-MeV)
       (quark-mass . mass-2.16-MeV)
       (heaviest-quark . top-quark)
       (lightest-quark . up-quark)))

    (neutron-queries
      (what-is-a-neutron)
      (udd-composition)
      ((what-is-a-neutron . neutron)
       (neutron . udd-composition)
       (neutron-decay . W-boson-mediates)
       (beta-decay . W-boson-mediates)
       (neutron-lifetime . mean-life-878.4-s)))

    (force-queries
      (what-holds-nucleus-together)
      (strong-force-binding)
      ((what-holds-nucleus-together . strong-force)
       (strong-force . color-charge)
       (nuclear-force . strong-force-binding)
       (weak-force . W-boson-mediates)
       (electromagnetic-force . photon)
       (gravity . weakest-force)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CHEMISTRY — ways humans ask about bonds, molecules
    ;;; ═══════════════════════════════════════════════════════════

    (bond-queries
      (what-is-a-covalent-bond)
      (shared-electron-pair)
      ((what-is-a-covalent-bond . covalent-bond)
       (covalent-bond . shared-electron-pair)
       (chemical-bond . covalent-bond)
       (how-do-atoms-bond . shared-electron-pair)
       (single-bond . energy-346-kJ/mol)
       (double-bond . energy-614-kJ/mol)
       (hydrogen-bond . energy-8-to-29-kJ/mol)
       (peptide-bond . energy-330-kJ/mol)))

    (molecule-queries
      (what-holds-molecules-together)
      (covalent-bond)
      ((what-holds-molecules-together . covalent-bond)
       (molecular-bond . covalent-bond)
       (carbon-bonds . four-valence-electrons)
       (water-molecule . bond-angle-104.5-degrees)
       (disulfide . disulfide-bond-S-S)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; BIOLOGY — ways humans ask about proteins, amino acids
    ;;; ═══════════════════════════════════════════════════════════

    (protein-queries
      (protein)
      (hydrogen-bond-donor-and-acceptor)
      ((protein . protein-structure)
       (protein-structure . hydrogen-bond-donor-and-acceptor)
       (protein-folding . hydrophobic-core-packing)
       (holds . containment)
       (together . stabilizes)
       (stabilizes . hydrophobic-core-packing)
       (alpha-helix . hydrogen-bonds-i-to-i-plus-4)
       (beta-sheet . hydrogen-bonds-between-strands)
       (fold . nonpolar)
       (backbone . constrains-backbone)
       (ramachandran . phi-psi-angles)))

    (amino-acid-queries
      (what-are-amino-acids)
      (20-standard-amino-acids)
      ((what-are-amino-acids . amino-acid)
       (amino-acid . amino-group)
       (nonpolar-amino-acids . nonpolar)
       (polar-amino-acids . polar-uncharged)
       (charged-amino-acids . positive-at-pH7)
       (histidine . pKa-6.0)
       (glycine . smallest-amino-acid)
       (proline . constrains-backbone)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; STRUCTURAL INTELLIGENCE — ways humans ask about the system
    ;;; ═══════════════════════════════════════════════════════════

    (learning-queries
      (how-does-it-learn)
      (registration)
      ((how-does-it-learn . registration)
       (learning . registration)
       (training . registration)
       (does-it-remember . remembers)
       (memory . body-only-grows)
       (forgetting . no-forgetting)
       (can-it-forget . no-receipt-removed)))

    (hallucination-queries
      (can-it-hallucinate)
      (CUT-eliminates-hallucination)
      ((can-it-hallucinate . CUT)
       (hallucination . impossible-by-construction)
       (does-it-make-things-up . CUT)
       (how-do-you-know . trace-chain-IS-proof)
       (prove-it . trace-chain)
       (citation . every-step-auditable)
       (source . oracle-verified)))

    (collision-queries
      (what-is-a-collision)
      (two-bodies-struck-together)
      ((what-is-a-collision . collision)
       (collision . daughter-particles)
       (daughter-particles . novel-structure)
       (collide . two-domains-struck)
       (discovery . collision-produces-daughter-particles)
       (how-does-it-discover . collision)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; VERBS — functional primitives of natural language
    ;;; ═══════════════════════════════════════════════════════════

    (verb-normalization
      (any-english-verb)
      (functional-primitive)
      ((any-english-verb . decomposes-to-primitive)
       (decomposes-to-primitive . contains)
       (contains . containment)
       (holds . containment)
       (has . containment)
       (includes . containment)
       (produces . transformation)
       (creates . transformation)
       (generates . transformation)
       (makes . transformation)
       (becomes . transformation)
       (causes . transformation)
       (connects . pair)
       (links . pair)
       (relates . pair)
       (flows . trace)
       (propagates . trace)
       (determines . context-collapses)
       (selects . context-collapses)
       (chooses . context-collapses)
       (learns . registration)
       (remembers . body-persists)
       (knows . registered-in-body)
       (understands . trace-chain-exists)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; QUESTION PATTERNS — structural templates
    ;;; ═══════════════════════════════════════════════════════════

    (what-is-X
      (what-is-query)
      (identity-of-X)
      ((what-is-query . extract-X)
       (extract-X . search-body-for-X)
       (search-body-for-X . found-trace-from-X)
       (found-trace-from-X . identity-of-X)))

    (what-is-X-made-of
      (composition-query)
      (containment-of-X)
      ((composition-query . extract-X)
       (extract-X . search-body-for-X-composition)
       (search-body-for-X-composition . found-containment-pairs)
       (found-containment-pairs . containment-of-X)))

    (how-does-X-work
      (mechanism-query)
      (trace-chain-of-X)
      ((mechanism-query . extract-X)
       (extract-X . search-body-for-X-transforms)
       (search-body-for-X-transforms . found-causal-pairs)
       (found-causal-pairs . trace-chain-of-X)))

    (why-does-X-cause-Y
      (causation-query)
      (trace-from-X-to-Y)
      ((causation-query . extract-X-and-Y)
       (extract-X-and-Y . search-body-for-path-X-to-Y)
       (search-body-for-path-X-to-Y . found-or-CUT)
       (found-or-CUT . trace-from-X-to-Y)))

    (what-connects-X-and-Y
      (collision-query)
      (daughter-particles-of-X-and-Y)
      ((collision-query . extract-X-and-Y)
       (extract-X-and-Y . collide-domain-of-X-with-domain-of-Y)
       (collide-domain-of-X-with-domain-of-Y . read-daughter-particles)
       (read-daughter-particles . daughter-particles-of-X-and-Y)))

  )

  ((norm . alpha-normalization-registered)))
