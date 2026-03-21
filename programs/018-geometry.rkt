#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; GEOMETRY — SPACE FROM CONTAINMENT
;;;
;;; A point is a presence: ()
;;; A line is two points in containment: (() ())
;;; A plane is three non-collinear points: (() () ())
;;; A volume is four non-coplanar points: (() () () ())
;;;
;;; Dimension = number of independent presences in a containment.
;;; The Dyck word's width at depth 1 IS the dimension.
;;;
;;; Euclidean, spherical, hyperbolic — different transforms
;;; on the same presences. The geometry IS the transform,
;;; not the space.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-geometry

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: geometric domain
  (

    ;;; Dimensions from containment
    (dimensions
      (point-0D)
      (spacetime-4D)
      ((point-0D . line-1D)
       (line-1D . plane-2D)
       (plane-2D . volume-3D)
       (volume-3D . spacetime-4D)))

    ;;; The five Platonic solids — the only regular convex polyhedra
    ;;; Their existence is a STRUCTURAL fact, not empirical.
    (platonic-solids
      (regular-convex-polyhedra)
      (exactly-five)
      ((regular-convex-polyhedra . tetrahedron-4-faces)
       (tetrahedron-4-faces . cube-6-faces)
       (cube-6-faces . octahedron-8-faces)
       (octahedron-8-faces . dodecahedron-12-faces)
       (dodecahedron-12-faces . icosahedron-20-faces)
       (icosahedron-20-faces . exactly-five)))

    ;;; Euler characteristic: V - E + F = 2 for convex polyhedra
    ;;; A topological invariant — doesn't change under deformation
    (euler-characteristic
      (vertices-edges-faces)
      (V-E+F=2)
      ((vertices-edges-faces . count-V)
       (count-V . count-E)
       (count-E . count-F)
       (count-F . V-minus-E-plus-F)
       (V-minus-E-plus-F . V-E+F=2)))

    ;;; Pi: the ratio of circumference to diameter
    ;;; Not a number. A STRUCTURAL RELATIONSHIP between
    ;;; circle and line. The relationship IS pi.
    (pi-as-structure
      (circle-and-diameter)
      (ratio-pi)
      ((circle-and-diameter . circumference-measured)
       (circumference-measured . diameter-measured)
       (diameter-measured . ratio-constant)
       (ratio-constant . ratio-pi)))

    ;;; Curvature: the geometry IS the transform
    (curvature-types
      (flat-space)
      (three-geometries)
      ((flat-space . euclidean-parallel-lines-never-meet)
       (euclidean-parallel-lines-never-meet . positive-curvature)
       (positive-curvature . spherical-parallel-lines-converge)
       (spherical-parallel-lines-converge . negative-curvature)
       (negative-curvature . hyperbolic-parallel-lines-diverge)
       (hyperbolic-parallel-lines-diverge . three-geometries)))

  )

  ;;; Vacuum tube
  ((tesla . geometry-registered)))
