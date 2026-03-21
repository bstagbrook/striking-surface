#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; PERIODIC TABLE — ELEMENTS AS STRUCTURAL DOMAINS
;;;
;;; An element is: Z protons (nesting depth), electron config
;;; (containment pattern), and chemical behavior (transforms).
;;;
;;; The periodic table is not a list. It's a STRUCTURE.
;;; Period = principal quantum number = nesting depth.
;;; Group = valence electron pattern = transform shape.
;;; Block = orbital type = containment geometry.
;;;
;;; The shape of the table IS the physics.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-periodic-table

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: element domain
  (

    ;;; Hydrogen: Z=1, 1s1, the simplest
    (hydrogen
      (Z=1-1s1)
      (lightest-element)
      ((Z=1-1s1 . one-proton-one-electron)
       (one-proton-one-electron . lightest-element)))

    ;;; Helium: Z=2, 1s2, noble — full shell
    (helium
      (Z=2-1s2)
      (noble-gas-inert)
      ((Z=2-1s2 . full-1s-shell)
       (full-1s-shell . no-valence-openings)
       (no-valence-openings . noble-gas-inert)))

    ;;; Carbon: Z=6, basis of organic chemistry
    (carbon
      (Z=6-2s2-2p2)
      (four-bonds-tetrahedral)
      ((Z=6-2s2-2p2 . four-valence-electrons)
       (four-valence-electrons . sp3-hybridization)
       (sp3-hybridization . four-bonds-tetrahedral)))

    ;;; Iron: Z=26, transition metal, d-block
    (iron
      (Z=26-3d6-4s2)
      (variable-oxidation)
      ((Z=26-3d6-4s2 . partially-filled-3d)
       (partially-filled-3d . d-electron-flexibility)
       (d-electron-flexibility . variable-oxidation)))

    ;;; Gold: Z=79, relativistic effects dominate
    (gold
      (Z=79-5d10-6s1)
      (yellow-color-from-relativity)
      ((Z=79-5d10-6s1 . 6s-contracts-17-percent)
       (6s-contracts-17-percent . 5d-expands-8-percent)
       (5d-expands-8-percent . gap-shrinks-to-2.4eV)
       (gap-shrinks-to-2.4eV . absorbs-blue-light)
       (absorbs-blue-light . yellow-color-from-relativity)))

    ;;; Mercury: Z=80, liquid at room temperature
    (mercury
      (Z=80-6s2-inert-pair)
      (liquid-metal)
      ((Z=80-6s2-inert-pair . 6s-pair-relativistically-contracted)
       (6s-pair-relativistically-contracted . refuses-to-bond)
       (refuses-to-bond . low-cohesive-energy)
       (low-cohesive-energy . liquid-metal)))

    ;;; Uranium: Z=92, f-block, radioactive
    (uranium
      (Z=92-5f3-6d1-7s2)
      (fissile-chain-reaction)
      ((Z=92-5f3-6d1-7s2 . heavy-nucleus-unstable)
       (heavy-nucleus-unstable . neutron-capture)
       (neutron-capture . nucleus-splits)
       (nucleus-splits . releases-neutrons)
       (releases-neutrons . fissile-chain-reaction)))

    ;;; The structural pattern of the table itself
    (periodic-structure
      (atomic-number-Z)
      (chemical-behavior)
      ((atomic-number-Z . electron-configuration)
       (electron-configuration . shell-filling-pattern)
       (shell-filling-pattern . valence-shape)
       (valence-shape . chemical-behavior)))

  )

  ;;; Vacuum tube
  ((tesla . periodic-table-registered)))
