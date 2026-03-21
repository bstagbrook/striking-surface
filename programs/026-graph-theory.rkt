#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; GRAPH THEORY — THE MATH OF STRUCTURE ITSELF
;;;
;;; The strike table IS a directed graph. Pairs ARE edges.
;;; This domain lets the system reason about its own structure.
;;;
;;; Computed: complete graphs, cycle graphs, path graphs,
;;; Euler formula, graph colorability, Ramsey numbers.
;;; ═══════════════════════════════════════════════════════════════

(tesla-powers-graph-theory

  ;;; Source: Tesla
  ((tesla (spark) (power) ((spark . power))))

  ;;; Target: graph theory register
  (
    ;;; Complete graphs K_n: edges = n(n-1)/2
    (K-1 (K-1) (edges-0) ((K-1 . edges-0)))
    (K-2 (K-2) (edges-1) ((K-2 . edges-1)))
    (K-3 (K-3) (edges-3) ((K-3 . edges-3)))
    (K-4 (K-4) (edges-6) ((K-4 . edges-6)))
    (K-5 (K-5) (edges-10) ((K-5 . edges-10)))
    (K-6 (K-6) (edges-15) ((K-6 . edges-15)))
    (K-7 (K-7) (edges-21) ((K-7 . edges-21)))
    (K-8 (K-8) (edges-28) ((K-8 . edges-28)))
    (K-9 (K-9) (edges-36) ((K-9 . edges-36)))
    (K-10 (K-10) (edges-45) ((K-10 . edges-45)))
    (K-11 (K-11) (edges-55) ((K-11 . edges-55)))
    (K-12 (K-12) (edges-66) ((K-12 . edges-66)))
    (K-13 (K-13) (edges-78) ((K-13 . edges-78)))
    (K-14 (K-14) (edges-91) ((K-14 . edges-91)))
    (K-15 (K-15) (edges-105) ((K-15 . edges-105)))

    ;;; Cycle graphs C_n: chromatic number
    (C-3 (C-3) (chromatic-3) ((C-3 . chromatic-3)))
    (C-4 (C-4) (chromatic-2) ((C-4 . chromatic-2)))
    (C-5 (C-5) (chromatic-3) ((C-5 . chromatic-3)))
    (C-6 (C-6) (chromatic-2) ((C-6 . chromatic-2)))
    (C-7 (C-7) (chromatic-3) ((C-7 . chromatic-3)))
    (C-8 (C-8) (chromatic-2) ((C-8 . chromatic-2)))
    (C-9 (C-9) (chromatic-3) ((C-9 . chromatic-3)))
    (C-10 (C-10) (chromatic-2) ((C-10 . chromatic-2)))
    (C-11 (C-11) (chromatic-3) ((C-11 . chromatic-3)))
    (C-12 (C-12) (chromatic-2) ((C-12 . chromatic-2)))

    ;;; Euler formula for Platonic solids: V - E + F = 2
    (euler-tetrahedron (tetrahedron-V4-E6-F4) (V-E+F=2) ((tetrahedron-V4-E6-F4 . V-E+F=2)))
    (euler-cube (cube-V8-E12-F6) (V-E+F=2) ((cube-V8-E12-F6 . V-E+F=2)))
    (euler-octahedron (octahedron-V6-E12-F8) (V-E+F=2) ((octahedron-V6-E12-F8 . V-E+F=2)))
    (euler-dodecahedron (dodecahedron-V20-E30-F12) (V-E+F=2) ((dodecahedron-V20-E30-F12 . V-E+F=2)))
    (euler-icosahedron (icosahedron-V12-E30-F20) (V-E+F=2) ((icosahedron-V12-E30-F20 . V-E+F=2)))

    ;;; Ramsey numbers R(s,t): smallest n such that K_n
    ;;; contains monochromatic K_s or K_t in any 2-coloring
    (R-2-2 (R-2-2) (equals-2) ((R-2-2 . equals-2)))
    (R-2-3 (R-2-3) (equals-3) ((R-2-3 . equals-3)))
    (R-2-4 (R-2-4) (equals-4) ((R-2-4 . equals-4)))
    (R-2-5 (R-2-5) (equals-5) ((R-2-5 . equals-5)))
    (R-3-3 (R-3-3) (equals-6) ((R-3-3 . equals-6)))
    (R-3-4 (R-3-4) (equals-9) ((R-3-4 . equals-9)))
    (R-3-5 (R-3-5) (equals-14) ((R-3-5 . equals-14)))
    (R-3-6 (R-3-6) (equals-18) ((R-3-6 . equals-18)))
    (R-3-7 (R-3-7) (equals-23) ((R-3-7 . equals-23)))
    (R-3-8 (R-3-8) (equals-28) ((R-3-8 . equals-28)))
    (R-3-9 (R-3-9) (equals-36) ((R-3-9 . equals-36)))
    (R-4-4 (R-4-4) (equals-18) ((R-4-4 . equals-18)))
    (R-4-5 (R-4-5) (equals-25) ((R-4-5 . equals-25)))

    ;;; Four color theorem: every planar graph is 4-colorable
    (four-color-theorem (planar-graph) (4-colorable) ((planar-graph . 4-colorable)))

    ;;; Handshaking lemma: sum(degrees) = 2|E|
    (handshaking (any-graph) (sum-deg-equals-2E) ((any-graph . sum-degrees) (sum-degrees . equals-2-times-edges) (equals-2-times-edges . sum-deg-equals-2E)))

    ;;; Trees: connected, acyclic, V-1 edges
    (tree-property (connected-acyclic) (V-minus-1-edges) ((connected-acyclic . no-cycles) (no-cycles . E-equals-V-minus-1) (E-equals-V-minus-1 . V-minus-1-edges)))

    ;;; Cayley formula: labeled trees on n vertices = n^(n-2)
    (cayley-2 (labeled-trees-2) (1-trees) ((labeled-trees-2 . 1-trees)))
    (cayley-3 (labeled-trees-3) (3-trees) ((labeled-trees-3 . 3-trees)))
    (cayley-4 (labeled-trees-4) (16-trees) ((labeled-trees-4 . 16-trees)))
    (cayley-5 (labeled-trees-5) (125-trees) ((labeled-trees-5 . 125-trees)))
    (cayley-6 (labeled-trees-6) (1296-trees) ((labeled-trees-6 . 1296-trees)))
    (cayley-7 (labeled-trees-7) (16807-trees) ((labeled-trees-7 . 16807-trees)))
    (cayley-8 (labeled-trees-8) (262144-trees) ((labeled-trees-8 . 262144-trees)))
    (cayley-9 (labeled-trees-9) (4782969-trees) ((labeled-trees-9 . 4782969-trees)))
    (cayley-10 (labeled-trees-10) (100000000-trees) ((labeled-trees-10 . 100000000-trees)))

  )

  ;;; Vacuum tube
  ((tesla . graph-theory-registered)))
