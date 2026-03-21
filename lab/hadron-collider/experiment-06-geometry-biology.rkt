#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; COLLISION: GEOMETRY × BIOLOGY at "folding"
;;;
;;; Geometry: surfaces fold — paper folding, manifold folding,
;;; curvature determines topology.
;;; Biology: proteins fold — amino acid sequence determines 3D
;;; structure. Misfolding = disease (prions, Alzheimer's).
;;;
;;; HYPOTHESIS: protein folding and geometric surface folding
;;; obey the same structural constraints. The invariant core
;;; (035) applies: some folds are essential, can't be changed
;;; without losing function.
;;; ═══════════════════════════════════════════════════════════════

(q:collide-geometry-biology
  (folding)
  (what-connects)
  (;;; Geometry wires
   (folding . surface-curvature)
   (surface-curvature . Gaussian-curvature-K)
   (Gaussian-curvature-K . positive-sphere)
   (Gaussian-curvature-K . zero-flat)
   (Gaussian-curvature-K . negative-saddle)
   (folding . topology-preserved)
   (topology-preserved . Euler-characteristic-invariant)

   ;;; Biology wires
   ;;; SOURCE: Anfinsen 1973 Nobel Prize — sequence determines fold
   (folding . amino-acid-sequence)
   (amino-acid-sequence . determines-3D-structure)
   (determines-3D-structure . function-from-shape)
   (function-from-shape . enzyme-catalysis)
   (folding . misfolding)
   (misfolding . prion-disease)
   (misfolding . amyloid-Alzheimers)
   (folding . folding-funnel)
   (folding-funnel . energy-landscape)
   (energy-landscape . native-state-minimum)

   ;;; Convergence: both have invariant topological properties
   (Euler-characteristic-invariant . topological-invariant)
   (native-state-minimum . topological-invariant)

   ;;; Novel connection: misfolding = wrong curvature
   (prion-disease . wrong-topology)
   (negative-saddle . wrong-topology)
   ))
