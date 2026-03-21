#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; COLLISION: THERMODYNAMICS × BIOLOGY at "energy"
;;;
;;; Thermodynamics: energy is conserved, entropy increases,
;;; systems move toward equilibrium.
;;; Biology: life maintains far-from-equilibrium states by
;;; consuming free energy. Death IS equilibrium.
;;;
;;; HYPOTHESIS: Life is a thermodynamic structure that USES
;;; entropy increase to maintain local order. Not fighting
;;; entropy — riding it.
;;; ═══════════════════════════════════════════════════════════════

(q:collide-thermo-bio
  (energy)
  (what-connects)
  (;;; Thermodynamics wires
   ;;; SOURCE: standard thermodynamics
   (energy . conserved-first-law)
   (energy . free-energy-G)
   (free-energy-G . drives-spontaneous-processes)
   (drives-spontaneous-processes . toward-equilibrium)
   (toward-equilibrium . maximum-entropy)
   (energy . heat-dissipation)
   (heat-dissipation . entropy-increases)

   ;;; Biology wires
   ;;; SOURCE: Schrödinger 1944 "What is Life?"
   (energy . ATP-currency)
   (ATP-currency . powers-cellular-work)
   (powers-cellular-work . maintains-far-from-equilibrium)
   (maintains-far-from-equilibrium . alive)
   (energy . food-intake)
   (food-intake . metabolism)
   (metabolism . ordered-structures)
   (ordered-structures . exports-entropy-as-heat)
   (exports-entropy-as-heat . entropy-increases)

   ;;; Collision product: both domains end at entropy-increases
   ;;; but biology USES entropy export to stay ordered
   (alive . consumes-free-energy)
   (consumes-free-energy . exports-entropy)
   (exports-entropy . environment-entropy-increases)
   (maximum-entropy . death)
   ))
