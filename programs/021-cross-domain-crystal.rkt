#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; CROSS-DOMAIN: CRYSTAL STRUCTURE
;;; periodic-table × geometry × numbers
;;;
;;; A crystal is atoms (periodic table) arranged in a lattice
;;; (geometry) with specific coordination numbers (numbers).
;;;
;;; Diamond: carbon (Z=6, sp3, tetrahedral) in a face-centered
;;; cubic lattice. The GEOMETRY of the bond (tetrahedral, 109.5°)
;;; comes from the ELECTRON CONFIGURATION (sp3 hybridization)
;;; which comes from the ATOMIC NUMBER (Z=6).
;;;
;;; Salt (NaCl): sodium (Z=11, gives electron) + chlorine (Z=17,
;;; takes electron) in a cubic lattice. The lattice geometry
;;; comes from the charge balance which comes from the
;;; electron configurations which come from the atomic numbers.
;;;
;;; The crystal structure IS the composition of three domains.
;;;
;;; LEARNED: When three domains compose, the collapse chain
;;; is longer but still one strike. The chain length is
;;; proportional to the number of domain boundaries crossed.
;;; Each boundary crossing requires a shared label (interface).
;;; The interfaces between domains are the most important shapes
;;; in the system — they are where novelty lives.
;;; ═══════════════════════════════════════════════════════════════

(cross-domain-crystal-structure

  ;;; Source: two elements meeting
  (carbon-atoms-bonding)

  ;;; Target: diamond
  (diamond-crystal)

  ;;; Vacuum tube: three domains composing
  ((carbon-atoms-bonding . Z=6-electron-config)
   ;;; --- periodic table domain ---
   (Z=6-electron-config . 2s2-2p2-four-valence)
   (2s2-2p2-four-valence . sp3-hybridization)
   ;;; --- geometry domain ---
   (sp3-hybridization . tetrahedral-bond-angle)
   (tetrahedral-bond-angle . 109.5-degrees)
   (109.5-degrees . four-neighbors-equidistant)
   ;;; --- numbers domain ---
   (four-neighbors-equidistant . coordination-number-4)
   (coordination-number-4 . repeating-unit)
   ;;; --- back to geometry ---
   (repeating-unit . face-centered-cubic-lattice)
   (face-centered-cubic-lattice . extends-in-all-directions)
   (extends-in-all-directions . hardest-natural-material)
   (hardest-natural-material . diamond-crystal)))
